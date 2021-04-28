package servlet;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "insertCustomerServlet")
public class insertCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int textType = Integer.parseInt(request.getParameter("type"));
        String textName = request.getParameter("name").toString();
        String textBirthday = request.getParameter("birthday").toString();
        boolean textGender = Boolean.parseBoolean(request.getParameter("gender").toString());
        String textPhone = request.getParameter("phone").toString();
        int textCardId = Integer.parseInt(request.getParameter("card_id"));
        String textEmail = request.getParameter("email").toString();
        String textAddress = request.getParameter("address").toString();

        Customer customer = new Customer(textType,textName,textBirthday,textGender, textPhone,textCardId,textEmail,textAddress);

        response.sendRedirect(request.getContextPath() + "/adminPage");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/webapp/insertCustomer.jsp");
        dispatcher.forward(request, response);
    }
}
