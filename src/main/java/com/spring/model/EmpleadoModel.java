/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.model;
import com.spring.entity.Empleado;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author Benjamín
 */
@Repository("empleadoService")
@Transactional
public class EmpleadoModel extends AbstractModel<BigDecimal, Empleado>{
    
   public Empleado findById(BigDecimal id) {
		Empleado e = getByKey(id);
                Hibernate.initialize(e.getPersona());
                return e;
	}

	public void saveEmpleado(Empleado empleado) {
		persist(empleado);
	}

	public void deleteEmpleadoById(BigDecimal idAfiliado) {
		Query query = getSession().createSQLQuery("delete from empleado where cod_empleado = :cod_empleado");
		query.setBigDecimal("cod_empleado", idAfiliado);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Empleado> findAllEmpleados() {
		Criteria criteria = createEntityCriteria();
		List<Empleado> empleados = (List<Empleado>) criteria.list();
                for(Empleado e : empleados){
                    Hibernate.initialize(e.getPersona());
                }
                
                return empleados;
	}
       
}
