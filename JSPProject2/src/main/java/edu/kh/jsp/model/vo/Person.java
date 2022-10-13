package edu.kh.jsp.model.vo;

public class Person {
	private String name; //캡슐화 원칙
	private int age;
	private String address;
	
	public Person() {}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age=age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	//Object.toString() 오버라이딩
	@Override
	public String toString() {
		return name + "/" + age + "/" + address;
	}
	
	
	
}
