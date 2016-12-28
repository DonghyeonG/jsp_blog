package team;

public class TeamDTO {
	private int no;
	private String name;
	private String gender;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private String[] skill; //createForm 의 여러개 스킬을 받아옴
	private String skillstr; //db select 결과를 저장 ,insert와 update의 문자열로 변환하여 저장
	private String hobby;
	private String filename;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String[] getSkill() {
		return skill;
	}
	public void setSkill(String[] skill) {  //Form 작업할때만  skill[]에 값이 들어옴
		this.skill = skill;
	}
	public String getSkillstr() {		
		if(skill!=null){ //insert,update를 하려고
			String skillstr="";
			for(int i=0;i<skill.length;i++){
				skillstr+=skill[i];
				if(i<skill.length-1){
					skillstr+=", ";
			}
			this.skillstr=skillstr;
			}
		}
		return skillstr;
	}
	public void setSkillstr(String skillstr) {
		this.skillstr = skillstr;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}
