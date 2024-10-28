package com.vanuston.medeil.util;

import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JTextField;

public class Validation {

    public boolean getValid(String hName) {
        boolean hosName = false;
        if (hName != null && hName.trim().length() > 0) {
            hosName = true;
        }
        return hosName;
    }

    public int getAlphaNumericValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z0-9. ]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getAlphaNumValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z0-9]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getNumberValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[0-9]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getDecimalValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[0-9.]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getAddressValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z0-9.,#/ ]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getCharacterValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z. ]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getEmailIdValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z][\\w\\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\\w\\.-]*[a-zA-Z0-9]\\.[a-zA-Z][a-zA-Z\\.]*[a-zA-Z]$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getPhoneNoValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[0-9+-]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getMobileNoValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[0-9+]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getYearValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[0-9+]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getWebsiteValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z0-9:./\\-]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getMaxValid(String hName, JTextField jT, int i) {
        int cnt = 0;
        if (hName != null && hName.trim().length() > 0) {
            if (hName.trim().length() > i) {
                jT.setText(hName.substring(0, hName.trim().length() - 1));
                cnt = 10;
            }
        }
        return cnt;
    }

    public static void numFormat(int key, JTextField jt, int i) {
        String value = jt.getText();
        if (value != null && value.trim().length() > 0) {
            if (!(key >= 48 && key <= 57 || key >= 96 && key <= 105 || key == 10 || key == 8 || key == 9 || key == 127 || key == 32 || key == 36 || key == 35)) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
            if (value.trim().length() > i) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
        }
    }

    public static void alphaNum(int key, JTextField jt, int i) {
        String value = jt.getText();
        if (value != null && value.trim().length() > 0) {
            if (!(key >= 65 && key <= 90 || key >= 48 && key <= 57 || key >= 96 && key <= 105 || key == 10 || key == 8 || key == 9 || key == 127 || key == 32 || key == 36 || key == 35 || key == 46 || key == 20)) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
            if (value.trim().length() > i) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
        }
    }

    public static void numberOnlyFormat(int key, JTextField jt, int i) {
        String value = jt.getText();
        if (value != null && value.trim().length() > 0) {
            if (!(key >= 48 && key <= 57 || key >= 96 && key <= 105 || key == 10 || key == 8 || key == 9 || key == 127 || key == 46)) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
            if (value.trim().length() > i) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
        }
    }

    public static void address(int key, JTextField jt, int i) {
        String value = jt.getText();
        if (value != null && value.trim().length() > 0) {
            if (!(key >= 65 && key <= 90 || key >= 48 && key <= 57 || key >= 96 && key <= 105 || key == 10 || key == 8 || key == 9 || key == 127 || key == 32 || key == 36 || key == 35 || key == 46 || key == 20 || key == 44)) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
            if (value.trim().length() > i) {

                jt.setText(value.substring(0, value.trim().length() - 1));
            }
        }
    }

    public static void PhoneNoFormat(int key, JTextField jt, int i) {
        String value = jt.getText();
        if (value != null && value.trim().length() > 0) {
            if (!(key >= 48 && key <= 57 || key >= 96 && key <= 105 || key == 10 || key == 8 || key == 9 || key == 127 || key == 46 || key == 46 || key == 46)) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
            if (value.trim().length() > i) {
                jt.setText(value.substring(0, value.trim().length() - 1));
            }
        }
    }

    public int getNOFormat(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[0-9]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;

                if (hName.trim().length() < i) {
                    cnt = 11;
                }
                if (hName.trim().length() > j) {
                    cnt = 1;
                }
            } else {
                cnt = 5;
            }
        } else {
            cnt = 4;
        }
        return cnt;
    }
    public int getMobNoValid(String hName) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[0-9+]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
                if (hName.trim().length() < 10) {
                    cnt = 11;
                }
                if (hName.trim().length() > 10) {
                    cnt = 1;
                }
            } else {
                cnt = 4;
            }
        }
        return cnt;
    }

    public static int hourFormat(String hour) {
        int a = 0;
        int hr = Integer.parseInt(hour);
        if (hr == 0) {
            a = 1;
        } else if (hr > 12) {
            a = 2;
        }
        return a;
    }

    public static int minuteFormat(String min) {
        int a = 0;
        int m = Integer.parseInt(min);
        if (m == 0) {
            a = 1;
        } else if (m > 59) {
            a = 2;
        }
        return a;
    }

    public static boolean isToday(String date) {
        boolean bo = false;
        String[] get = date.split("-");
        Calendar da = Calendar.getInstance();
        return bo;
    }

    public int getAlphaSpecialValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z.& ]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }

    public int getAlphaValid(String hName, int i, int j) {
        int cnt = 0;
        Pattern p = Pattern.compile("^[a-zA-Z. ]+$");
        if (hName != null && hName.trim().length() > 0) {
            Matcher m = p.matcher(hName);
            boolean matchFound = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }
        if (hName.trim().length() < i) {
            cnt = 11;
        }
        if (hName.trim().length() > j) {
            cnt = 1;
        }
        return cnt;
    }
}
