package kr.co.ohdeokrionline.model.vo;


public class BalanceSheet_DTO {
	
	// 손익 계산서 DTO
	String user_id;
	String bal_date;		//날짜
	int sal_on;			//매출_온라인(판매)+항목
	int sal_mar;		//매출_직거래장터+항목
	int sal_cost;		//매출_원가(제품의 원가)-항목
	int ex_renter;		//지출_대여비
	int ex_supplies; 	//지출_소모품비
	int ex_etc;			//지출_잡비
	int sal_gain;		//잡이익
	int ex_inter;		//이자비용
	int ex_loss;		//잡손실
	int sal_income;		//당기순이익
	int sal_total; 		//매출 총액
	
	public int getSal_total() {
		return sal_total;
	}
	public void setSal_total(int sal_total) {
		this.sal_total = sal_total;
	}

	// 판매량 관리 DTO
	int salmount;

	
	public int getSalmount() {
		return salmount;
	}
	public void setSalmount(int salmount) {
		this.salmount = salmount;
	}
	

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBal_date() {
		return bal_date;
	}
	public void setBal_date(String bal_date) {
		this.bal_date = bal_date;
	}
	public int getSal_on() {
		return sal_on;
	}
	public void setSal_on(int sal_on) {
		this.sal_on = sal_on;
	}
	public int getSal_mar() {
		return sal_mar;
	}
	public void setSal_mar(int sal_mar) {
		this.sal_mar = sal_mar;
	}
	public int getSal_cost() {
		return sal_cost;
	}
	public void setSal_cost(int sal_cost) {
		this.sal_cost = sal_cost;
	}
	public int getEx_renter() {
		return ex_renter;
	}
	public void setEx_renter(int ex_renter) {
		this.ex_renter = ex_renter;
	}
	public int getEx_supplies() {
		return ex_supplies;
	}
	public void setEx_supplies(int ex_supplies) {
		this.ex_supplies = ex_supplies;
	}
	public int getEx_etc() {
		return ex_etc;
	}
	public void setEx_etc(int ex_etc) {
		this.ex_etc = ex_etc;
	}
	public int getSal_gain() {
		return sal_gain;
	}
	public void setSal_gain(int sal_gain) {
		this.sal_gain = sal_gain;
	}
	public int getEx_inter() {
		return ex_inter;
	}
	public void setEx_inter(int ex_inter) {
		this.ex_inter = ex_inter;
	}
	public int getEx_loss() {
		return ex_loss;
	}
	public void setEx_loss(int ex_loss) {
		this.ex_loss = ex_loss;
	}
	public int getSal_income() {
		return sal_income;
	}
	public void setSal_income(int sal_income) {
		this.sal_income = sal_income;
	}
	
	@Override
	public String toString() {
		return "BalanceSheet_DTO [user_id=" + user_id + ", bal_date="
				+ bal_date + ", sal_on=" + sal_on + ", sal_mar=" + sal_mar
				+ ", sal_cost=" + sal_cost + ", ex_renter=" + ex_renter
				+ ", ex_supplies=" + ex_supplies + ", ex_etc=" + ex_etc
				+ ", sal_gain=" + sal_gain + ", ex_inter=" + ex_inter
				+ ", ex_loss=" + ex_loss + ", sal_income=" + sal_income + "]";
	}
	
	
	
	
}
