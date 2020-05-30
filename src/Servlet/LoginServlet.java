package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;

/**
 * Author:GGi
 * Date:2020-05-29-17:04
 * description：<描述>
 */
@WebServlet(name = "/LoginServlet",urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameStr = request.getParameter("name");
        HashSet<String> names = new HashSet<String>();
        names.add("Huang");
        names.add("Xing");
        names.add("fei");
        names.add("123");
        if (nameStr.equals("")){
            String r = "null";
            PrintWriter pw = response.getWriter();
            pw.print(r);
            pw.flush();
        }else {
            String r = names.contains(nameStr) ? "Has" : "No has";
            PrintWriter pw = response.getWriter();
            pw.print(r);
            pw.flush();
        }
        System.out.println("已执行。");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
