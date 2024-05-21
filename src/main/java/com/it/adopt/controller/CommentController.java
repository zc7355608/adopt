package com.it.adopt.controller;

import com.it.adopt.bean.Answer;
import com.it.adopt.bean.Comment;
import com.it.adopt.bean.Pet;
import com.it.adopt.bean.User;
import com.it.adopt.mapper.AnswerMapper;
import com.it.adopt.mapper.UserMapper;
import com.it.adopt.service.CommentService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * ClassName: CommentController
 * Package: com.it.adopt.controller
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/23 21:38
 * @Version: 1.0.0
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private CommentService commentService;
    @Resource
    private UserMapper userMapper;

    @Resource
    private AnswerMapper answerMapper;

    @RequestMapping("/allComments")
    @ResponseBody
    public List<Comment> allComments(@RequestParam("petId") Integer petId){
        List<Comment> comments = commentService.selectByPetId(petId);
        for(int i=0; i<comments.size(); i++){
            //给Comment对象的user属性赋值
            Comment comment = comments.get(i);
            User user = userMapper.selectByPrimaryKey(comment.getUserId());
            comment.setUser(user);

            //给Comment对象的answers属性赋值
            comment.setAnswers(answerMapper.selectByCommentId(comment.getId()));
            List<Answer> answers = comment.getAnswers();
            //设置每个answers中的username
            for(int j=0; j<answers.size(); j++){
                Answer answer = answers.get(j);
                User usr = userMapper.selectByPrimaryKey(answer.getUserId());
                answer.setUsername(usr.getUsername());

                //设置answer中的commentUser
            }
        }
        return comments;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public String insert(@RequestParam("comment") String content, HttpSession session){
        User user = (User) session.getAttribute("user");
        Pet pet = (Pet) session.getAttribute("pet");
        Comment comment = new Comment();
        comment.setUserId(user.getId());
        comment.setPetId(pet.getId());
        comment.setCommentTime(new Date(System.currentTimeMillis()));
        comment.setContent(content);
        int rows = commentService.insert(comment);
        return (rows>0) ? "yes" : "error";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String delete(@PathVariable("id") Integer id){
        int rows = commentService.deleteById(id);
        //将关于该条评论的回复都删除掉
        answerMapper.deleteByCommentid(id);
        return (rows>0) ? "yes" : "error";
    }
}