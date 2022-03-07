/**
 * 
 */
package com.ecommerce.app.entity;
import javax.persistence.*;

/**
 * @author adminmx
 *
 */

@Entity
@Table(name ="category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private int id;
    private String name;
    private String departament;
    
    public Category() {}
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getId(){
        return id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
	public String getDepartament() {
		return departament;
	}
	public void setDepartament(String departament) {
		this.departament = departament;
	}
}
