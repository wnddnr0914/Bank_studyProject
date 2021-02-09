package algo;

import java.sql.Timestamp;

public class acc_w_d {
	int Key;
	int money;
	Timestamp tra_time;
	int get_acc;
	public int getKey() {
		return Key;
	}
	public void setKey(int key) {
		Key = key;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public Timestamp getTra_time() {
		return tra_time;
	}
	public void setTra_time(Timestamp tra_time) {
		this.tra_time = tra_time;
	}
	public int getGet_acc() {
		return get_acc;
	}
	public void setGet_acc(int get_acc) {
		this.get_acc = get_acc;
	}
	public int getGive_acc() {
		return give_acc;
	}
	public void setGive_acc(int give_acc) {
		this.give_acc = give_acc;
	}
	int give_acc;
	
}
