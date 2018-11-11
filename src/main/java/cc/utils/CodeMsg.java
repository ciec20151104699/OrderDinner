package cc.utils;

public class CodeMsg {


        private int code;

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

    private String msg;


        private CodeMsg( ) {
        }

        private CodeMsg( int code,String msg ) {
            this.code = code;
            this.msg = msg;
        }

        //不定参的构造函数
        public CodeMsg  fillArgs(Object... args) {
            int code = this.code;
            String message = String.format(this.msg, args);
            return new CodeMsg(code, message);
        }

        @Override
        public String toString() {
            return "CodeMsg [code=" + code + ", msg=" + msg + "]";
        }



}
