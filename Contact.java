package com.Entities;

public class Contact {
   private int id;
   private String name;
   private String email;
   private String phno;
   private String about;
   private int userid;
/**
 * 
 */
public Contact() {
	super();
	// TODO Auto-generated constructor stub
}
/**
 * @param name
 * @param email
 * @param phno
 * @param about
 * @param userId
 */
public Contact(String name, String email, String phno, String about, int userid) {
	super();
	this.name = name;
	this.email = email;
	this.phno = phno;
	this.about = about;
	this.userid = userid;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhno() {
	return phno;
}
public void setPhno(String phno) {
	this.phno = phno;
}
public String getAbout() {
	return about;
}
public void setAbout(String about) {
	this.about = about;
}
public int getuserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
@Override
public String toString() {
	return "Contact [id=" + id + ", name=" + name + ", email=" + email + ", phno=" + phno + ", about=" + about
			+ ", userid=" + userid + "]";
}

     
}