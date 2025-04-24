<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの設定を定義 -->
<ul class="navbar-nav mt-10"> <!-- ナビゲーションバー -->

    <li class="nav-link dropdown"> <!-- ベーキングデザートのカテゴリ -->
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">ベーキングデザート</a>
        <ul class="dropdown-menu"> <!-- サブカテゴリ -->
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=101&l=2">チーズケーキ</a> <!-- チーズケーキ -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=102&l=2">ティラミス</a> <!-- ティラミス -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=103&l=2">ブラウニー</a> <!-- ブラウニー -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=104&l=2">フィナンシェ</a> <!-- フィナンシェ -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=105&l=2">ロールケーキ</a> <!-- ロールケーキ -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=106&l=2">ショートケーキ</a> <!-- ショートケーキ -->
</li>
        </ul>
    </li>

    <li class="nav-link dropdown"> <!-- 冷菓＆ムース類のカテゴリ -->
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">冷菓＆ムース類</a>
        <ul class="dropdown-menu"> <!-- サブカテゴリ -->
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=201&l=2">クレームブリュレ</a> <!-- クレームブリュレ -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=202&l=2">ミルクプリン</a> <!-- ミルクプリン -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=203&l=2">ヨーグルトムースケーキ</a> <!-- ヨーグルトムースケーキ -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=204&l=2">フルーツゼリームース</a> <!-- フルーツゼリームース -->
</li>
        </ul>
    </li>

    <li class="nav-link dropdown"> <!-- 冷たいデザートのカテゴリ -->
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">冷たいデザート</a>
        <ul class="dropdown-menu"> <!-- サブカテゴリ -->
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=301&l=2">手作りアイスクリーム</a> <!-- 手作りアイスクリーム -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=302&l=2">ジェラート</a> <!-- ジェラート -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=303&l=2">パッピンスキット</a> <!-- パッピンスキット -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=304&l=2">生フルーツシャーベットカップ</a> <!-- 生フルーツシャーベットカップ -->
</li>
        </ul>
    </li>

    <li class="nav-link dropdown"> <!-- キャンディ＆ゼリーのカテゴリ -->
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">キャンディ＆ゼリー</a>
        <ul class="dropdown-menu"> <!-- サブカテゴリ -->
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=401&l=2">グミゼリー</a> <!-- グミゼリー -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=402&l=2">マシュマロ</a> <!-- マシュマロ -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=403&l=2">手作りキャラメル</a> <!-- 手作りキャラメル -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=404&l=2">ジェリービーンズ</a> <!-- ジェリービーンズ -->
</li>
        </ul>
    </li>

    <li class="nav-link dropdown"> <!-- チョコレートデザートのカテゴリ -->
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">チョコレートデザート</a>
        <ul class="dropdown-menu"> <!-- サブカテゴリ -->
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=501&l=2">手作りトリュフチョコレート</a> <!-- 手作りトリュフチョコレート -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=502&l=2">ガナッシュ生チョコレート</a> <!-- ガナッシュ生チョコレート -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=503&l=2">チョコレートバー</a> <!-- チョコレートバー -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=504&l=2">抹茶チョコレート</a> <!-- 抹茶チョコレート -->
</li>
        </ul>
    </li>

    <li class="nav-link dropdown"> <!-- 伝統菓子のカテゴリ -->
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">伝統菓子</a>
        <ul class="dropdown-menu"> <!-- サブカテゴリ -->
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=601&l=2">餅（もち）</a> <!-- 餅（もち） -->
</li>
<li>
<a class="dropdown-item" href="${contextPath}/shop/list?c=602&l=2">羊羹（ようかん）</a> <!-- 羊羹（ようかん） -->
</li>
        </ul>
    </li>
</ul> <!-- ナビゲーションバー終了 -->