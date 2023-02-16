package com.omoi.filter;

import com.omoi.constant.UserRole;
import com.omoi.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author xingj
 * @create 2023/2/16 23:59
 */
@WebFilter({"/admin/*", "/teacher/*", "/student/*"})
public class PermissionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        boolean dispatcher = false;

        servletResponse.setContentType("text/html;charset=utf-8");
        servletRequest.setCharacterEncoding("utf-8");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        User current = (User) session.getAttribute("current");

        if (current == null) {
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request, response);
            return;
        }

        String requestURI = request.getRequestURI();

        if (current.getRole() == UserRole.STUDENT) {
            if (requestURI.startsWith("/student")) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                dispatcher = true;
            }
        } else if (current.getRole() == UserRole.TEACHER) {
            if (requestURI.startsWith("/teacher") || requestURI.startsWith("/student")) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                dispatcher = true;
            }
        } else if (current.getRole() == UserRole.ADMIN) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            dispatcher = true;
        }

        if (dispatcher) {
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}
