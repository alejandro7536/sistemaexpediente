/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.controller;
import com.spring.entity.Clinica;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import com.spring.entity.Empleado;
import com.spring.entity.Persona;
import com.spring.model.ClinicaModel;
import com.spring.model.EmpleadoModel;
import java.math.BigDecimal;
import java.util.Date;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
/**
 *
 * @author Benjamín
 */
@RestController
public class EmpleadoController {
    
    @Autowired
    EmpleadoModel modelEmp;
    
    @Autowired
    ClinicaModel modelCli;
    
    @RequestMapping(value = "/empleados/", method = RequestMethod.GET)
    public List getEmpleados(){
        List<Empleado> empleados = modelEmp.findAllEmpleados(); 
        return empleados;
    }
    
    @RequestMapping(value = "/empleados/", method = RequestMethod.POST)
    public ResponseEntity<Void> addEmpleado(@RequestBody Persona persona){
            Clinica cliEscogida = modelCli.findByNombre("Central");
            Empleado emp = new Empleado(persona.getCodPersona(), persona, cliEscogida, new Date(), "Enfermera");
            modelEmp.saveEmpleado(emp);
            return new ResponseEntity<>(HttpStatus.CREATED);
	}
    
    @RequestMapping(value="/empleados/{id}", method = RequestMethod.GET )
	public ResponseEntity<Empleado> getPersonById(@PathVariable("id") BigDecimal id) {
            Empleado emp = modelEmp.findById(id);
		return new ResponseEntity<>(emp, HttpStatus.OK);
	}
    
    @RequestMapping(value="/empleados/{id}", method = RequestMethod.PUT )
	public ResponseEntity<Empleado> updatePerson(@RequestBody Empleado paciente) { 
	//modelPac.updateEmpleado(paciente);
	return new ResponseEntity<>(paciente, HttpStatus.OK);
    }
        
    @RequestMapping(value="/empleados/{id}", method = RequestMethod.DELETE )
        public ResponseEntity<Void> deleteEmpleado(@PathVariable("id") BigDecimal id) {
            modelEmp.deleteEmpleadoById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
    
}
