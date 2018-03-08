package com.zyj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Housepic entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "housepic", catalog = "anjule")
public class Housepic implements java.io.Serializable {

	// Fields

	private Integer id;
	private House house;
	private String picurl;

	// Constructors

	/** default constructor */
	public Housepic() {
	}

	/** full constructor */
	public Housepic(House house, String picurl) {
		this.house = house;
		this.picurl = picurl;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "house")
	public House getHouse() {
		return this.house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	@Column(name = "picurl", length = 100)
	public String getPicurl() {
		return this.picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

}