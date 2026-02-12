package model;

public class Item {
    private int itemID;
    private String itemDescription;
    private String brand;
    private String category;

    private String team;
    private int amount;
    private String size;
    private float price;
    private String imageURL;

    public int getItemID() {
        return itemID;
    }
    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public String getBrand() { return brand; }

    public void setBrand(String brand) { this.brand = brand; }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setItemDescription(String itemDescription) { this.itemDescription = itemDescription; }

    public String getItemDescription() { return itemDescription; }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getTeam() { return team; }

    public void setTeam(String team) { this.team = team; }
}
