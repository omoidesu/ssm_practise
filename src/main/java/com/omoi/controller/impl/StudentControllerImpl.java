package com.omoi.controller.impl;

import com.omoi.controller.StudentController;
import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;
import com.omoi.entity.User;
import com.omoi.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author xingj
 * @create 2023/2/14 21:30
 */
@RequestMapping("/student")
@Controller
public class StudentControllerImpl implements StudentController {
    private StudentService studentService;

    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/showCourse")
    public String showCourse() {
        return "/student/showCourse";
    }

    @GetMapping("/selectedCourse")
    public String showSelectedCourse() {
        return "/student/showSelectedCourse";
    }

    @GetMapping("/completeCourse")
    public String showCompletedCourse() {
        return "/student/showCompletedCourse";
    }

    @GetMapping("/changePassword")
    public String changePassword() {
        return "/student/selfPassword";
    }

    @GetMapping("/course")
    @ResponseBody
    public List<Course> getCourseWithStudent(
            @RequestParam("studentId") String studentId,
            @RequestParam(value = "courseName", required = false) String courseName) {
        return studentService.getCourseByStudent(studentId, courseName);
    }

    @PutMapping("/course")
    @ResponseBody
    public MessageDto studentSignup(@RequestParam String courseId, @RequestParam String studentId) {
        return studentService.signUpCourse(courseId, studentId);
    }

    @GetMapping("/selected")
    @ResponseBody
    public List<Course> getSelectedCourse(
            @RequestParam("studentId") String studentId,
            @RequestParam(value = "complete", required = false) String complete) {
        return studentService.getAllSelectedCourse(studentId, complete);
    }

    @DeleteMapping("/course")
    @ResponseBody
    public MessageDto cancelCourse(@RequestParam String courseId, @RequestParam String studentId) {
        return studentService.cancelCourse(courseId, studentId);
    }

    @PostMapping("/password")
    public String changeAccountPassword(@RequestParam(value = "password") String password, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("current");
        String username = currentUser.getUsername();
        studentService.changePassword(username, password);
        return "redirect:/logout";
    }
}
