package com.hyp.learn.blog.utils;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.util.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.utils
 * hyp create at 20-3-18
 **/
public class HtmlUtil {
    /**
     * 获取Element
     *
     * @param htmlDocument
     * @param id
     * @return
     */
    public static Element getElementById(Document htmlDocument, String id) {
        if (htmlDocument == null || id == null || id.equals("")) {
            return null;
        }
        return htmlDocument.getElementById(id);
    }

    /**
     * 替换所有标签
     *
     * @param content
     * @return
     */
    public static String html2Text(String content) {
        if (StringUtils.isEmpty(content)) {
            return "";
        }
        // 定义HTML标签的正则表达式
        String regEx_html = "<[^>]+>";
        content = content.replaceAll(regEx_html, "").replaceAll(" ", "");
        content = content.replaceAll("&quot;", "\"")
                .replaceAll("&nbsp;", "")
                .replaceAll("&amp;", "&")
                .replaceAll("\n", " ")
                .replaceAll("&#39;", "\'")
                .replaceAll("&lt;", "<")
                .replaceAll("&gt;", ">")
                .replaceAll("[ \\f\\t\\v]{2,}", "\t");

        String regEx = "<.+?>";
        Pattern pattern = Pattern.compile(regEx);
        Matcher matcher = pattern.matcher(content);
        content = matcher.replaceAll("");
        return content.trim();
    }
}
