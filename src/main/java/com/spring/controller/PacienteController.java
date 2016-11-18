/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.controller;
import com.spring.entity.Clinica;
import com.spring.entity.Expediente;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import com.spring.entity.Paciente;
import com.spring.entity.Persona;
import com.spring.model.ClinicaModel;
import com.spring.model.ExpedienteModel;
import com.spring.model.PacienteModel;
import java.math.BigDecimal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
/**
 *
 * @author Benjamín
 */

@RestController
public class PacienteController {
    
    @Autowired
    PacienteModel modelPac;
    
    @Autowired
    ExpedienteModel modelExp;
    
    @Autowired
    ClinicaModel modelCli;
    
    
    @RequestMapping(value = "/pacientes/", method = RequestMethod.GET)
    public List getPacientes(){
        List<Paciente> pacientes = modelPac.findAllPacientes(); 
        return pacientes;
    }
    
    @RequestMapping(value = "/pacientes/", method = RequestMethod.POST)
    public ResponseEntity<Void> addPaciente(@RequestBody Persona persona){
            Clinica cliEscogida = modelCli.findByNombre("Central");
            Paciente paciente = new Paciente(persona.getCodPersona(), persona);
            modelExp.saveExpediente(paciente, cliEscogida);
            return new ResponseEntity<>(HttpStatus.CREATED);
	}
    
    @RequestMapping(value="/pacientes/{id}", method = RequestMethod.GET )
	public ResponseEntity<Paciente> getPersonById(@PathVariable("id") BigDecimal id) {
            Paciente person = modelPac.findById(id);
		return new ResponseEntity<>(person, HttpStatus.OK);
	}
    
    @RequestMapping(value="/pacientes/{id}", method = RequestMethod.PUT )
	public ResponseEntity<Paciente> updatePerson(@RequestBody Paciente paciente) { 
	//modelPac.updatePaciente(paciente);
	return new ResponseEntity<>(paciente, HttpStatus.OK);
    }
        
    @RequestMapping(value="/pacientes/{id}", method = RequestMethod.DELETE )
        public ResponseEntity<Void> deletePaciente(@PathVariable("id") BigDecimal id) {
            modelExp.deleteExpedienteById(id);
            modelPac.deletePacienteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
    
     @RequestMapping(value="/expedientes/{id}", method = RequestMethod.GET )
	public ResponseEntity<Expediente> getExpediente(@PathVariable("id") BigDecimal id) {
            Expediente exp = modelExp.findById(id);
		return new ResponseEntity<>(exp, HttpStatus.OK);
	}
        
}
