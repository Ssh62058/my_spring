package com.my.shop.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {

    // サムネイル画像のサイズを定義
    static final int THUMB_WIDTH = 300;
    static final int THUMB_HEIGHT = 300;

    // ファイルアップロード処理
    public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath) throws Exception {

        UUID uid = UUID.randomUUID(); // ファイル名の一意性を保証するUUIDを生成
        String newFileName = uid + "_" + fileName; // 新しいファイル名を生成
        String imgPath = uploadPath + ymdPath; // 保存パスを設定

        // ファイルを指定された場所にコピー
        File target = new File(imgPath, newFileName);
        FileCopyUtils.copy(fileData, target);

        // サムネイル画像の生成
        String thumbFileName = "s_" + newFileName; // サムネイルファイル名を生成
        File image = new File(imgPath + File.separator + newFileName); // 元画像のパス
        File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName); // サムネイルの保存先

        if (image.exists()) { // 元画像が存在する場合
            thumbnail.getParentFile().mkdirs(); // サムネイル用ディレクトリがない場合は作成
            Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail); // サムネイルを生成
        }

        return newFileName; // アップロードしたファイル名を返す
    }

    // 日付ベースのディレクトリ構造を生成
    public static String calcPath(String uploadPath) {
        Calendar cal = Calendar.getInstance(); // 現在の日付を取得
        String yearPath = File.separator + cal.get(Calendar.YEAR); // 年フォルダ
        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // 月フォルダ
        String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // 日フォルダ

        makeDir(uploadPath, yearPath, monthPath, datePath); // 年/月/日のフォルダを作成
        makeDir(uploadPath, yearPath, monthPath, datePath + "\\s"); // サムネイル用のフォルダを作成

        return datePath; // ディレクトリパスを返す
    }

    // 指定されたパスにディレクトリを作成
    private static void makeDir(String uploadPath, String... paths) {
        if (new File(paths[paths.length - 1]).exists()) { return; } // 最後のパスが存在する場合は何もしない

        for (String path : paths) { // パスリストをループ処理
            File dirPath = new File(uploadPath + path); // フォルダパスを生成
            if (!dirPath.exists()) { // フォルダが存在しない場合
                dirPath.mkdir(); // フォルダを作成
            }
        }
    }
}