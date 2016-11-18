/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.model;

import com.spring.entity.Clinica;
import com.spring.entity.Expediente;
import com.spring.entity.Paciente;
import java.math.BigDecimal;
import java.util.Date;
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
@Repository("expedienteService")
@Transactional
public class ExpedienteModel extends AbstractModel<BigDecimal, Expediente>{
    
        public Expediente findById(BigDecimal id) {
		Expediente exp = getByKey(id);
                if(exp!=null){
                //Hibernate.initialize(exp.getClinica());
                Hibernate.initialize(exp.getPaciente());
                Hibernate.initialize(exp.getPaciente().getPersona());
                }
                
                return exp;
	}

	public void saveExpediente(Paciente paciente, Clinica cli) {
                Expediente expediente = new Expediente(paciente.getIdAfiliado(), cli, paciente, new Date());
                persist(expediente);
	}

	public void deleteExpedienteById(BigDecimal codExpediente) {
		Query query = getSession().createSQLQuery("delete from expediente where cod_expediente = :cod_expediente");
		query.setBigDecimal("cod_expediente", codExpediente);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Expediente> findAllExpedientes() {
            //Comment
		Criteria criteria = createEntityCriteria();
		return (List<Expediente>) criteria.list();
	}
                
        public Expediente findExpedienteByPaciente(BigDecimal idAfiliado) {
		Query query = getSession().createSQLQuery("select * from expediente where id_afiliado = :id_afiliado");
		query.setBigDecimal("id_afiliado", idAfiliado);
                return (Expediente) query.uniqueResult();
	}
}
