package com.omoi.controller.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.omoi.constant.Gender;
import com.omoi.controller.AdminController;
import com.omoi.dto.MessageDto;
import com.omoi.entity.Course;
import com.omoi.entity.Student;
import com.omoi.entity.Teacher;
import com.omoi.entity.User;
import com.omoi.service.AdminService;
import com.omoi.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RequestMapping("/admin")
@Controller
public class AdminControllerImpl implements AdminController {
    private final AdminService adminService;
    private final CommonService commonService;

    @Autowired
    public AdminControllerImpl(AdminService adminService, CommonService commonService) {
        this.adminService = adminService;
        this.commonService = commonService;
    }

    @GetMapping("/showCourse")
    public String showCourse() {
        return "/admin/showCourse";
    }

    @GetMapping("/showStudent")
    public String showStudent() {
        return "admin/showStudent";
    }

    @GetMapping("/showTeacher")
    public String showTeacher() {
        return "admin/showTeacher";
    }

    @GetMapping("/changeOther")
    public String changeOther() {
        return "/admin/password";
    }

    @GetMapping("/changePassword")
    public String changePassword() {
        return "/admin/selfPassword";
    }

    @GetMapping("/addCourse")
    public String addCourse() {
        return "admin/course";
    }

    @GetMapping("/addStudent")
    public String addStudent() {
        return "admin/student";
    }

    @GetMapping("/addTeacher")
    public String addTeacher() {
        return "admin/teacher";
    }

    @DeleteMapping("/course")
    @ResponseBody
    public MessageDto deleteCourse(Integer courseId) {
        return adminService.deleteCourse(courseId);
    }

    /**
     * @deprecated user Course class at formal parameter for auto create a teacher object
     */
    @Deprecated
    public String editCourse(@RequestParam Map<String, String> params) {
        Course course = Course.builder()
                .courseId(params.get("courseId"))
                .courseName(params.get("courseName"))
                .teacherId(params.get("teacherId"))
                .courseDate(params.get("courseDate"))
                .courseAddress(params.get("courseAddress"))
                .courseTimes(params.get("courseTimes"))
                .courseType(params.get("courseType"))
                .courseBelong(params.get("courseBelong"))
                .coursePoint(params.get("coursePoint")).build();
        adminService.editCourse(course);
        return "/admin/showCourse";
    }

    @PostMapping("/course")
    public String editCourse(Course course) {
        adminService.editCourse(course);
        return "/admin/showCourse";
    }

    @GetMapping("/course/{id}")
    public String showCourseDetail(@PathVariable("id") Integer id, HttpServletRequest request) {
        Course targetCourse = commonService.getCourseById(id);

        request.setAttribute("course", targetCourse);
        return "/admin/course";
    }

    @DeleteMapping("/student")
    @ResponseBody
    public MessageDto deleteStudent(Integer studentId) {
        return adminService.deleteStudent(studentId);
    }

    /**
     * @deprecated user Student class at formal parameter for auto create a teacher object
     */
    @Deprecated
    public String editStudent(@RequestParam Map<String, String> params) {
        Student student = Student.builder()
                .studentId(params.get("studentId"))
                .studentName(params.get("studentName"))
                .studentGender(Integer.parseInt(params.get("studentGender")) == Gender.MALE ? "男" : "女")
                .studentBirthday(params.get("studentBirthday"))
                .studentRegister(params.get("studentRegister"))
                .studentBelong(params.get("studentBelong")).build();
        adminService.editStudent(student);
        return "/admin/showStudent";
    }

    @PostMapping("/student")
    public String editStudent(Student student) {
        adminService.editStudent(student);
        return "/admin/showStudent";
    }

    @GetMapping("/student/{id}")
    public String showStudentDetail(@PathVariable("id") Integer id, HttpServletRequest request) {
        Student targetStudent = commonService.getStudentById(id);

        request.setAttribute("student", targetStudent);
        return "/admin/student";
    }

    @DeleteMapping("/teacher")
    @ResponseBody
    public MessageDto deleteTeacher(Integer teacherId) {
        return adminService.deleteTeacher(teacherId);
    }

    /**
     * @deprecated user Teacher class at formal parameter for auto create a teacher object
     */
    @Deprecated
    public String editTeacher(@RequestParam Map<String, String> params) {
        Teacher teacher = Teacher.builder()
                .teacherId(params.get("teacherId"))
                .teacherName(params.get("teacherName"))
                .teacherGender(Integer.parseInt(params.get("teacherGender")) == Gender.MALE ? "男" : "女")
                .teacherBirthday(params.get("teacherBirthday"))
                .teacherEducation(params.get("teacherEducation"))
                .teacherRank(params.get("teacherRank"))
                .teacherRegister(params.get("teacherRegister"))
                .teacherBelong(params.get("teacherBelong")).build();
        adminService.editTeacher(teacher);
        return "/admin/showTeacher";
    }

    @PostMapping("/teacher")
    public String editTeacher(Teacher teacher) {
        adminService.editTeacher(teacher);
        return "/admin/showTeacher";
    }

    @GetMapping("/teacher/{id}")
    public String showTeacherDetail(@PathVariable("id") Integer id, HttpServletRequest request) {
        Teacher targetTeacher = commonService.getTeacherById(id);

        request.setAttribute("teacher", targetTeacher);
        return "/admin/teacher";
    }

    @PostMapping("/password")
    public String changeAccountPassword(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "password") String password, HttpServletRequest request) {
        boolean usernameIsNull = false;

        if (username == null) {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("current");
            username = currentUser.getUsername();
            usernameIsNull = true;
        }

        MessageDto message = adminService.changePassword(username, password);

        if (usernameIsNull) {
            return "redirect:/logout";
        }

        ObjectMapper mapper = new ObjectMapper();
        String messageString = "";
        try {
            messageString = mapper.writeValueAsString(message);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("message", messageString);
        return "/admin/password";
    }

    @GetMapping("/user")
    @ResponseBody
    public MessageDto userIfExist(String username) {
        return adminService.userExist(username);
    }
}
