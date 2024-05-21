package com.it.adopt.controller;

import com.it.adopt.bean.Answer;
import com.it.adopt.bean.User;
import com.it.adopt.service.AnswerService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;

/**
 * ClassName: AnswerController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/23 23:53
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/answer")
public class AnswerController {
    @Resource
    private AnswerService answerService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public String insertAnswer(@RequestParam("commentId") Integer commentId, @RequestParam("content") String content, HttpSession session){
        User user = (User) session.getAttribute("user");

        Answer answer = new Answer();
        answer.setUserId(user.getId());
        answer.setCommentId(commentId);
        answer.setAnswerTime(new Date(System.currentTimeMillis()));
        answer.setContent(content);

        int rows = answerService.insert(answer);
        return (rows>0) ? "yes" : "error";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String delete(@PathVariable("id") Integer id){
        int rows = answerService.deleteById(id);
        return (rows>0) ? "yes" : "error";
    }
}
