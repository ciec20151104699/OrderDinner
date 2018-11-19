package cc.utils;

public class ResultEntity<T> {

    private int code;
    private String msg;
    private T data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    /**
     *  成功时候的调用
     * */
    public static  <T> ResultEntity<T> success(T data){
        return new ResultEntity<T>(data);
    }

    /**
     *  失败时候的调用
     * */
    public static  <T> ResultEntity<T> error(CodeMsg codeMsg){
        return new ResultEntity<T>(codeMsg);
    }


    /**
     * 成功的构造函数
     * @param data
     */
    public ResultEntity(T data){
        this.code=0;//默认000000是成功
        this.msg="SUCCESS";
        this.data = data;
    }

    public ResultEntity(int code, String msg,T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
    public ResultEntity() {
    }
    public static ResultEntity errorEntity(String msg) {
        ResultEntity resultEntity = new ResultEntity();
        resultEntity.setCode(-1);
        resultEntity.setMsg(msg);
        return resultEntity;

    }
    /**
     * 失败的构造函数
     * @param
     * @param
     */
    private ResultEntity(CodeMsg codeMsg) {
        if(codeMsg != null) {
            this.code = codeMsg.getCode();
            this.msg = codeMsg.getMsg();
        }
    }
}


