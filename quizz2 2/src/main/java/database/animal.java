package database;

public class animal {
	private int petid;
	private String petname;
	private Double petprice;
	private String petimg;


	public animal() {
	}
	
	public animal(int petid, String petname, double petprice, String petimg) {
		super();
		this.petid = petid;
		this.petname = petname;
		this.petprice = petprice;
		this.petimg = petimg;
	}


	public int getId() {
		return petid;
	}

	public void setId(int petid) {
		this.petid = petid;
	}

	public String getName() {
		return petname;
	}

	public void setName(String petname) {
		this.petname = petname;
	}

	public Double getPrice() {
		return petprice;
	}

	public void setPrice(Double petprice) {
		this.petprice = petprice;
	}

	public String getImage() {
		return petimg;
	}

	public void setImage(String petimg) {
		this.petimg = petimg;
	}

	@Override
	public String toString() {
		return "Product [id=" + petid + ", name=" + petname + ", price=" + petprice + ", image="
				+ petimg + "]";
	}
	
	
}