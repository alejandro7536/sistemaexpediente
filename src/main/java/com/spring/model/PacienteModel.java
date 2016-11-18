/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.model;
import com.spring.entity.Paciente;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author Benjamín
 */
@Repository("pacienteService")
@Transactional
public class PacienteModel extends AbstractModel<BigDecimal, Paciente>{
    
   public Paciente findById(BigDecimal id) {
		Paciente p = getByKey(id);
                Hibernate.initialize(p.getPersona());
                return p;
	}

	public void savePaciente(Paciente paciente) {
		persist(paciente);
	}

	public void deletePacienteById(BigDecimal idAfiliado) {
		Query query = getSession().createSQLQuery("delete from paciente where id_afiliado = :id_afiliado");
		query.setBigDecimal("id_afiliado", idAfiliado);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Paciente> findAllPacientes() {
		Criteria criteria = createEntityCriteria();
		List<Paciente> pacientes = (List<Paciente>) criteria.list();
                for(Paciente p : pacientes){
                    Hibernate.initialize(p.getPersona());
                }
                
                return pacientes;
	}
       
}
