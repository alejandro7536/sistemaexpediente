/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
/**
 *
 * @author Benjamín
 */
@Controller
public class PageController {
    
    @RequestMapping(value="/")
    public String inicio(){
        return "index";
    } 
    
    @RequestMapping(value="/pacientes")
    public String pacientes(){
        return "pacientes";
    }
    
    @RequestMapping(value="/expediente", method = RequestMethod.GET)
    public String expediente(@RequestParam(value="id") int id){
        return "expediente";
    }
    
    @RequestMapping(value="/empleados")
    public String expediente(){
        return "empleados";
    }
    
}
