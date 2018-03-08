package com.zyj.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * House entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "house", catalog = "anjule")
@JsonIgnoreProperties(value={"housepics"})
public class House implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private String topic;
	private Integer rent;
	private String indexpic;
	private String renttype;
	private String housetype;
	private Integer shi;
	private Integer ting;
	private String leasemode;
	private String village;
	private String location;
	private String deloc;
	private String area;
	private String decorate;
	private String orientation;
	private String floor;
	private String type;
	private String introduce;
	private String tel;
	private String publicdate;
	private String status;
	private Set<Housepic> housepics = new HashSet<Housepic>(0);

	// Constructors

	/** default constructor */
	public House() {
	}

	/** full constructor */
	public House(User user, String topic, int rent, String renttype,
			String housetype, int shi,int ting,String leasemode, String village,
			String location,String deloc,String area, String decorate, String orientation,
			String floor, String type, String introduce, String tel,
			String publicdate, String status, Set<Housepic> housepics) {
		this.user = user;
		this.topic = topic;
		this.rent = rent;
		this.renttype = renttype;
		this.housetype = housetype;
		this.shi=shi;
		this.ting=ting;
		this.leasemode = leasemode;
		this.village = village;
		this.location = location;
		this.deloc=deloc;
		this.area = area;
		this.decorate = decorate;
		this.orientation = orientation;
		this.floor = floor;
		this.type = type;
		this.introduce = introduce;
		this.tel = tel;
		this.publicdate = publicdate;
		this.status=status;
		this.housepics = housepics;
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
	@JoinColumn(name = "user")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "status", length = 45)
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "topic", length = 45)
	public String getTopic() {
		return this.topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	@Column(name = "rent", length = 45)
	public Integer getRent() {
		return this.rent;
	}

	public void setRent(Integer rent) {
		this.rent = rent;
	}

	@Column(name = "renttype", length = 45)
	public String getRenttype() {
		return this.renttype;
	}
	
	
	@Column(name = "indexpic", length = 80)
	public String getIndexpic() {
		return indexpic;
	}

	public void setIndexpic(String indexpic) {
		this.indexpic = indexpic;
	}

	public void setRenttype(String renttype) {
		this.renttype = renttype;
	}

	@Column(name = "housetype", length = 45)
	public String getHousetype() {
		return this.housetype;
	}

	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}
	
	@Column(name = "shi", length = 45)
	public Integer getShi() {
		return shi;
	}

	public void setShi(Integer shi) {
		this.shi = shi;
	}
	@Column(name = "ting", length = 45)
	public Integer getTing() {
		return ting;
	}

	public void setTing(Integer ting) {
		this.ting = ting;
	}

	@Column(name = "leasemode", length = 45)
	public String getLeasemode() {
		return this.leasemode;
	}

	public void setLeasemode(String leasemode) {
		this.leasemode = leasemode;
	}

	@Column(name = "village", length = 45)
	public String getVillage() {
		return this.village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	@Column(name = "location", length = 45)
	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
	@Column(name = "deloc", length = 45)
	public String getDeloc() {
		return deloc;
	}

	public void setDeloc(String deloc) {
		this.deloc = deloc;
	}

	@Column(name = "area", length = 45)
	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "decorate", length = 45)
	public String getDecorate() {
		return this.decorate;
	}

	public void setDecorate(String decorate) {
		this.decorate = decorate;
	}

	@Column(name = "orientation", length = 45)
	public String getOrientation() {
		return this.orientation;
	}

	public void setOrientation(String orientation) {
		this.orientation = orientation;
	}

	@Column(name = "floor", length = 45)
	public String getFloor() {
		return this.floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	@Column(name = "type", length = 45)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "introduce", length = 45)
	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@Column(name = "tel", length = 45)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "publicdate", length = 45)
	public String getPublicdate() {
		return this.publicdate;
	}

	public void setPublicdate(String publicdate) {
		this.publicdate = publicdate;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "house")
	public Set<Housepic> getHousepics() {
		return this.housepics;
	}

	public void setHousepics(Set<Housepic> housepics) {
		this.housepics = housepics;
	}

}