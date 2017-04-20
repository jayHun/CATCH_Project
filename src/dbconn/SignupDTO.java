package dbconn;


public class SignupDTO {
	private String id;
	private String name;
	private String birth;
	private String nick;
	private String hobby;
	private String religion;
	private String introduce;
	private String sector;
	private String passwd;
	private String photo;
	private int std_num;
	private int hp;
	private int age;
	
	
	public void setId(String id){
		this.id=id;
	}
	public String getId() {
		return id;
	}
	
	public void setName(String name){
		this.name=name;
	}
	public String getName() {
		return name;
	}
	
	public void setStd_num(int std_num){
		this.std_num=std_num;
	}
	public int getStd_num() {
		return std_num;
	}
	
	public void setHp(int hp){
		this.hp=hp;
	}
	public int getHp() {
		return hp;
	}
	
	public void setAge(int age){
		this.age=age;
	}
	public int getAge() {
		return age;
	}
	
	public void setBirth(String birth){
		this.birth=birth;
	}
	public String getBirth() {
		return birth;
	}
	
	public void setNick(String nick){
		this.nick=nick;
	}
	public String getNick() {
		return nick;
	}
	
	public void setHobby(String hobby){
		this.hobby=hobby;
	}
	public String getHobby() {
		return hobby;
	}
	
	public void setReligion(String religion){
		this.religion=religion;
	}
	public String getReligion() {
		return religion;
	}
	
	public void setIntroduce(String introduce){
		this.introduce=introduce;
	}
	public String getIntroduce() {
		return introduce;
	}
	
	public void setSector(String sector){
		this.sector=sector;
	}
	public String getSector() {
		return sector;
	}
	
	public void setPasswd(String passwd){
		this.passwd=passwd;
	}
	public String getPasswd() {
		return passwd;
	}
	
	public void setPhoto(String photo){
		this.photo=photo;
	}
	public String getPhoto() {
		return photo;
	}
}
