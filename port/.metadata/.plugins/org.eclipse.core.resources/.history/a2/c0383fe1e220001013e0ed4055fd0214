package com.my.shop.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {

    // 定数定義 横幅、高さ
    static final int THUMB_WIDTH = 300;
    static final int THUMB_HEIGHT = 300;

    // ファイルアップロードメソッド
    // uploadPath: ファイルが保存される基本パス, fileName: 元のファイル名, fileData: ファイルデータ(byte配列)
    // ymdPath: 日付別保存パス(年/月/日形式)
    // UUID.randomUUID ファイルの固有名を生成
    public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath) throws Exception {

        UUID uid = UUID.randomUUID(); // ファイルの固有名を生成
        // 元のファイル名の前に付けて新しいファイル名を生成します
        String newFileName = uid + "_" + fileName;
        String imgPath = uploadPath + ymdPath;
        /*
        ファイル保存パスの設定およびファイルコピー
        uploadPath: ファイルが保存される基本パス
        ymdPath: 日付別保存パス(年/月/日形式)
        imgPathは最終ファイルパスで、FileCopyUtils.copy()で渡されたファイルデータをそのパスに保存します
        */
        File target = new File(imgPath, newFileName);
        FileCopyUtils.copy(fileData, target);

        // サムネイル生成: アップロードされた画像を基にthumbnailatorライブラリを使用してサムネイルを生成します
        String thumbFileName = "s_" + newFileName; // "s_"プレフィックスとnewFileName(s_1.jpg)を結合して生成
        File image = new File(imgPath + File.separator + newFileName); // 元のファイルのパス
        // サムネイルを保存するパスを生成
        File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);
        // サムネイルを保存するフォルダ[thumbnail.getParentFile()]がない場合、これを生成する imgPath/s/
        if (image.exists()) { // 画像ファイルが存在するか確認
            // サムネイルディレクトリ生成
            thumbnail.getParentFile().mkdirs();
            // サムネイル生成
            Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
        }
        return newFileName; // サムネイルを生成した後、元のファイル名を返します
    }

    public static String calcPath(String uploadPath) { // このメソッドはアップロードするファイルのパスを日付別に生成します
        // アップロードパスは年、月、日[カレンダーオブジェクトを使用して年、月、日のフォルダパスを生成]のディレクトリ構造に従います
        Calendar cal = Calendar.getInstance();
        String yearPath = File.separator + cal.get(Calendar.YEAR); // 現在の年を取得します
        // File.separator: OSに適したファイルパス区切り文字(Windowsでは"\"、Unix系では"/")
        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        // 現在の月は0から始まるインデックスで返されます。例えば1月は0、2月は1、12月は11であるため+1 この結果は"2025/02"
        String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
        // 上記3つの変数の結果は"2025/02/11"

        makeDir(uploadPath, yearPath, monthPath, datePath); // 引数で渡されたパスに従ってディレクトリを生成
        makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

        return datePath;
    }

    private static void makeDir(String uploadPath, String... paths) {
        if (new File(paths[paths.length - 1]).exists()) { return; } // 渡されたパスが存在するか確認
        // パスが既に存在する場合、このメソッドは何もせず即座にリターンします
        for (String path : paths) { // 渡されたすべてのパスを繰り返し処理
            // ディレクトリ生成
            File dirPath = new File(uploadPath + path);
            
            if (!dirPath.exists()) { // ディレクトリが存在するか確認
                dirPath.mkdir(); // 存在しない場合、ディレクトリを生成
            }
        }
    }
}