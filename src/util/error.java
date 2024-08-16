package util;

public class error extends RuntimeException {
    private position pos;
    private String message;
    private String error_message;

    public error(position pos, String message, String error_message) {
        this.pos = pos;
        this.message = message;
        this.error_message = error_message;
    }

    public String get_message() {
        return error_message;
    }

    public String toString() {
        return get_message();
    }

}
