package com.omoi.controller.impl;

import com.omoi.controller.TeacherController;
import com.omoi.dto.MessageDto;
import com.omoi.dto.StudentScoreDto;
import com.omoi.entity.User;
import com.omoi.service.TeacherService;
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
@RequestMapping("/teacher")
@Controller
public class TeacherControllerImpl implements TeacherController {
    private TeacherService teacherService;

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @GetMapping("/showCourse")
    public String showCourse() {
        return "/teacher/showCourse";
    }

    @GetMapping("/changePassword")
    public String changePassword() {
        return "/teacher/selfPassword";
    }

    @GetMapping("/course/{id}")
    public String getCourseStudents(@PathVariable("id") String courseId, HttpServletRequest request) {
        request.setAttribute("course", courseId);
        return "/teacher/showStudent";
    }

    @GetMapping("/course/students")
    @ResponseBody
    public List<StudentScoreDto> getStudentAndScoreByCourseId(String courseId) {
        return teacherService.getStudentScoreByCourseId(courseId);
    }

    @PostMapping("/score")
    @ResponseBody
    public MessageDto setStudentScore(@RequestBody StudentScoreDto studentScore, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User current = (User) session.getAttribute("current");
        String teacherId = current.getUsername();

        return teacherService.setStudentScore(studentScore, teacherId);
    }

    @PostMapping("/password")
    public String changeAccountPassword(@RequestParam(value = "password") String password, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("current");
        String username = currentUser.getUsername();
        teacherService.changePassword(username, password);
        return "redirect:/logout";
    }
}
