package cc.entity.model;

public class UserMenu {
    private Integer id;

    private Integer userId;

    private Integer menuId;

    private Long updateTime;

    private Integer flag;

    private Long dataDay;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Long updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Long getDataDay() {
        return dataDay;
    }

    public void setDataDay(Long dataDay) {
        this.dataDay = dataDay;
    }
}