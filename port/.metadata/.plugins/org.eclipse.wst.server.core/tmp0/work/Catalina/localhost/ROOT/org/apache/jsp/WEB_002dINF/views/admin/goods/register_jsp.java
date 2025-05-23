/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.69
 * Generated at: 2025-04-22 18:33:25 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.admin.goods;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../../include/header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container-fluid bg-gradient-primary\">\r\n");
      out.write("<div class=\"row\">\r\n");
      out.write("<div class=\"col-md-12\">\r\n");
      out.write("<div class=\"d-flex\">\r\n");
      out.write("<div class=\"w-25\">\r\n");
      out.write("<div class=\"mt-5 pt-5\"></div>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/lnb.jsp", out, false);
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"w-75 p-4 mt-5 pt-5 \">\r\n");
      out.write("<h2 class=\"text-white fw-bold\">商品登録</h2>\r\n");
      out.write("<form method=\"post\" enctype=\"multipart/form-data\"><!-- イメージや他のファイルを登録する際に使用 --> \r\n");
      out.write("<div class=\"input-group\">\r\n");
      out.write("<label class=\"form-label text-white\">一次分類</label>\r\n");
      out.write("<select class=\"form-select category1 mx-3\">\r\n");
      out.write("<option value=\"\">\r\n");
      out.write("全体\r\n");
      out.write("</option>\r\n");
      out.write("</select>\r\n");
      out.write("<label class=\"form-label text-white\">二次分類</label>\r\n");
      out.write("<select class=\"form-select category2 mx-3\" name=\"cateCode\">\r\n");
      out.write("<option value=\"\">\r\n");
      out.write("全体\r\n");
      out.write("</option>\r\n");
      out.write("</select>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"input-group mt-5\">\r\n");
      out.write("<label class=\"form-label text-white w-10\">商品名</label>\r\n");
      out.write("<input type=\"text\" id=\"gdsName\" name=\"gdsName\" class=\"form-control w-90\" required/>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"input-group mt-5\">\r\n");
      out.write("<label class=\"form-label text-white w-10\">商品価格</label>\r\n");
      out.write("<input type=\"text\" id=\"gdsPrice\" name=\"gdsPrice\" class=\"form-control w-90\" required/>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"input-group mt-5\"><!-- 数量フィールドでは数値以外の文字列を使用できないように設定 -->\r\n");
      out.write("<label class=\"form-label text-white w-10\">商品数量</label>\r\n");
      out.write("<input type=\"text\" id=\"gdsStock\" name=\"gdsStock\" class=\"form-control w-90\" required/>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"input-group mt-5\">\r\n");
      out.write("<label class=\"form-label text-white w-10\">商品紹介</label>\r\n");
      out.write("<textarea rows=\"5\" id=\"gdsDes\" name=\"gdsDes\" class=\"form-control\" required>内容を記入してください</textarea>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/ckeditorConfig.js\">\r\n");
      out.write("</script>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"input-group mt-5\"><!-- 実際にファイルをアップロードする場所 -->\r\n");
      out.write("<label class=\"form-label text-white w-10\">イメージ</label>\r\n");
      out.write("<input type=\"file\" id=\"gdsImg\" name=\"file\" class=\"form-control w-90\"/>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<!-- アップロードしたイメージを確認 -->\r\n");
      out.write("<div class=\"select_img my-3\">\r\n");
      out.write("<img src=\"\" style=\"width:100px;\"/>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"d-flex\">\r\n");
      out.write("<div class=\"text-white\">原本イメージ</div>\r\n");
      out.write("<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.gdsImg}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" style=\"width:100px;\"/>\r\n");
      out.write("<div class=\"text-white\">サムネイル</div>\r\n");
      out.write("<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.gdsThumbImg}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" style=\"width:50px;\"/>\r\n");
      out.write("</div>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/changeImgFunction.js\"></script>\r\n");
      out.write("<div class=\"text-white\">");
      out.print(request.getRealPath("/") );
      out.write("</div>\r\n");
      out.write("<button type=\"submit\" id=\"register_Btn\" class=\"btn btn-warning btn-lg btn-block my-4\">\r\n");
      out.write("登録\r\n");
      out.write("</button>\r\n");
      out.write("</form>\r\n");
      out.write("<script>\r\n");
      out.write("let jsonData = JSON.parse('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${category}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("');\r\n");
      out.write("</script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/jsonDrop.js\"><!-- 二つのドロップダウンでカテゴリを選択する際、JSONを利用してOracle DBのカテゴリを選択 -->\r\n");
      out.write("</script>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../../include/footer.jsp", out, false);
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
