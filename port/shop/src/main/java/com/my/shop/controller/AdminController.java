package com.my.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.my.shop.service.AdminService;
import com.my.shop.utils.UploadFileUtils;
import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.MemberVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*") // 管理者関連のURLをまとめる
public class AdminController {
    
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    @Inject
    AdminService adminService; // サービス層との連携
    
    @Resource(name="uploadPath") // アップロードパスの定義（ファイルアップロード用のフォルダ）
    private String uploadPath;
    
    // 管理者メイン画面を表示する
    @GetMapping("/index") // admin/index
    public void getIndex() throws Exception {
        logger.info("管理者画面に入る");
    }
    
    // 商品登録ページを表示する（GETリクエスト）
    @GetMapping("/goods/register")
    public void getGoodsRegister(Model model) throws Exception {
        logger.info("商品登録ページに入る");
        
        // カテゴリー情報を初期化して取得する
        List<CategoryVO> category = null; // CategoryVO型のリスト変数categoryを宣言する
        category = adminService.category(); // DBからカテゴリー情報を取得
        model.addAttribute("category", JSONArray.fromObject(category)); 
        // 取得したカテゴリー情報をJSON形式に変換し、ビューに渡す
    }
        
    // 商品登録処理（POSTリクエスト）
    @PostMapping("/goods/register")
    public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
        // 画像アップロード先のパスを設定
        String imgUploadPath = uploadPath + File.separator + "imgUpload";
        // 年月日ごとのフォルダを作成するためのパス取得
        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
        String fileName = null;
    
        // 添付ファイルが存在するかチェック
        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            // ファイルアップロード処理（オリジナル画像とサムネイルの作成）
            fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName); // オリジナル画像パス
            vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName); // サムネイル画像パス
        } else {
            // 添付ファイルがない場合、デフォルト画像（none.png）を設定
            fileName = File.separator + "images" + File.separator + "none.png";
            vo.setGdsImg(fileName);
            vo.setGdsThumbImg(fileName);
        }
    
        adminService.register(vo); // 商品情報をDBに登録する
        return "redirect:/admin/index"; // 登録完了後、管理者メイン画面にリダイレクト
    }
    
    // 商品リストを表示する（登録済みの商品情報を一覧表示）
    @GetMapping(value="/goods/list")
    public void getGoodsList(Model model) throws Exception {
        logger.info("商品リストを表示");
        List<GoodsViewVO> list = adminService.goodslist(); // 商品リストをサービスから取得
        model.addAttribute("list", list); // 商品リストをモデルに追加しビューへ渡す
    }
    
    // 商品詳細ページを表示する（リストから選択した商品の詳細情報を表示）
    @GetMapping(value="/goods/view")
    public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
        logger.info("詳細ページ");
        GoodsViewVO goods = adminService.goodsView(gdsNum); // 指定された商品の詳細情報を取得
        model.addAttribute("goods", goods); // 取得した商品情報をビューに渡す
    }
    
    // CKEditor用の画像アップロード処理
    @PostMapping(value="/goods/ckUpload")
    public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
        logger.info("CKEditorに添付ファイルとして登録したい場合、このメソッドを使用してください");
        // ファイル名の衝突を避けるためUUIDを生成
        UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null; // スクリプト出力用オブジェクト

        // 文字化け防止のためレスポンスの文字コードをUTF-8に設定
        res.setCharacterEncoding("utf-8");
        res.setContentType("text/html; charset=utf-8");
        
        try {
            String fileName = upload.getOriginalFilename(); // アップロードファイルの元の名前を取得
            byte[] bytes = upload.getBytes();
            // CKEditor用アップロードパスを設定
            String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes); // ファイル書き込み
            out.flush(); // バッファ内のデータ送信

            // CKEditorのコールバック関数用パラメータを取得
            String callback = req.getParameter("CKEditorFuncNum");
            printWriter = res.getWriter();
            String fileUrl = "/ckUpload/" + uid + "_" + fileName; // アップロードファイルのURL生成
            // アップロード完了後のスクリプトをレスポンスとして返す
            printWriter.println("<script> " +
                "window.parent.CKEDITOR.tools.callFunction(" +
                callback + ",'" + fileUrl + "','画像をアップロードしました')" +
                "</script>");
            printWriter.flush();
        } catch(IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) {
                e.printStackTrace();
            }
        }
        return;    
    }
    
    // 商品修正ページを表示する（GETリクエスト）
    @GetMapping(value="/goods/modify")
    public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
        // URLパラメータ「n」から商品番号を取得する
        logger.info("修正ページに入る");
        GoodsViewVO goods = adminService.goodsView(gdsNum); // 商品の現在情報を取得
        model.addAttribute("goods", goods); // 既存の商品の詳細をビューに渡す
        List<CategoryVO> category = null;
        category = adminService.category(); // 商品に利用可能なカテゴリーを取得
        model.addAttribute("category", JSONArray.fromObject(category)); // JSON形式に変換して追加
        
        // 追加のカテゴリー情報（必要に応じて）をモデルに設定
        List<CategoryVO> categoryVO = adminService.category();
        model.addAttribute("categoryVO", categoryVO);
    }
    
    // 商品修正処理（POSTリクエスト）
    // 新しい画像がアップロードされた場合は更新、アップロードされなければ既存の画像を使用
    @PostMapping(value="/goods/modify")
    public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
        logger.info("商品修正");
        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            // 既存の画像およびサムネイルファイルを削除
            new File(uploadPath + req.getParameter("gdsImg")).delete();
            new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
            // 新しい画像をアップロードしてファイルパスを設定する処理
            String imgUploadPath = uploadPath + File.separator + "imgUpload";
            String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
            String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
            vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
        } else {
            // 新しいファイルがアップロードされなかった場合は、既存の画像パスを使用
            vo.setGdsImg(req.getParameter("gdsImg"));
            vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
        }
        adminService.goodsModify(vo); // 商品情報を更新
        return "redirect:/admin/index"; // 更新後、メイン画面へリダイレクト
    }
    
    // 商品削除処理（POSTリクエスト）
    @PostMapping(value="/goods/delete")
    public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
        logger.info("商品削除");
        adminService.goodsDelete(gdsNum); // 商品番号に基づいて商品を削除
        return "redirect:/admin/index"; // 削除完了後、管理者メインへリダイレクト
    }
    
    // 管理者用の全顧客注文リストを表示（注文の一覧表示）
    @GetMapping(value="/shop/orderList")
    public void getOrderList(Model model) throws Exception {
        logger.info("管理者が確認するこのサイトのすべての顧客注文リスト");
        List<OrderVO> orderList = adminService.orderList(); // 全注文を取得
        model.addAttribute("orderList", orderList); // 注文リストをモデルに追加
    }
    
    // 注文詳細ページを表示（注文番号によって詳細情報を取得）
    @GetMapping(value="/shop/orderView")
    public void getOrderList(@RequestParam("n") String orderId, Model model, OrderVO order) throws Exception {
        logger.info("顧客注文の詳細ページ");
        order.setOrderId(orderId); // OrderVOに注文IDを設定
        List<OrderListVO> orderView = adminService.orderView(order); // 注文詳細情報を取得
        model.addAttribute("orderView", orderView); // モデルに追加し、詳細ページで表示
    }
    
    // 注文詳細のステータス変更処理（配送ステータスの更新）
    @PostMapping(value="/shop/orderView")
    public String delivery(OrderVO order) throws Exception {
        logger.info("配送ステータス設定ページに入る");
        adminService.delivery(order); // 注文の配送ステータスを更新
        // 配送が更新された注文の各商品の在庫を更新する
        List<OrderListVO> orderView = adminService.orderView(order);
        GoodsVO goods = new GoodsVO();
        for (OrderListVO i : orderView) {
            goods.setGdsNum(i.getGdsNum());
            goods.setGdsStock(i.getCartStock());
            adminService.changeStock(goods); // 在庫数を変更する
        }
        return "redirect:/admin/shop/orderView?n=" + order.getOrderId(); // 更新後、詳細ページへリダイレクト
    }
    
    // すべてのレビュー（コメント）を表示する
    @GetMapping(value="/shop/allReply")
    public void getAllReply(Model model) throws Exception {
        logger.info("顧客が書いたすべてのコメント");
        List<ReplyListVO> reply = adminService.allReply(); // 全コメント情報を取得
        model.addAttribute("reply", reply); // コメントリストをビューに渡す
    }
    
    // 全レビューの削除処理（特定のコメントIDに基づいて削除）
    @PostMapping(value="/shop/allReply")
    public String PostAllReply(ReplyVO reply) throws Exception {
        logger.info("顧客が書いたすべてのコメントを削除");
        adminService.deleteReply(reply.getRepNum()); // コメントの識別番号で削除処理を実施
        return "redirect:/admin/shop/allReply"; // 削除完了後、再度リストページへ
    }
    
    // ユーザー一覧を表示する（会員登録済みの全ユーザー情報を表示）
    @GetMapping(value="/shop/allUser")
    public void getUserList(Model model) throws Exception {
        logger.info("ユーザテーブル");
        List<MemberVO> memberVO = adminService.memberList(); // ユーザー情報を取得
        model.addAttribute("memberList", memberVO); // モデルにユーザーリストを設定
    }
}