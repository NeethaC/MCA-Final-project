/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Neetha
 */
public class Subject_internal_model {
    String subjectname;
    String subjectcode;
    String internal;
    String external;
    String sub_external;
    int mark_id;
    String sub_internal;
    String status;

    public String getSubjectname() {
        return subjectname;
    }

    public void setSubjectname(String subjectname) {
        this.subjectname = subjectname;
    }

    public String getSubjectcode() {
        return subjectcode;
    }

    public void setSubjectcode(String subjectcode) {
        this.subjectcode = subjectcode;
    }

    public String getInternal() {
        return internal;
    }

    public void setInternal(String internal) {
        this.internal = internal;
    }

    public int getMark_id() {
        return mark_id;
    }

    public void setMark_id(int mark_id) {
        this.mark_id = mark_id;
    }

    public String getSub_external() {
        return sub_external;
    }

    public void setSub_external(String sub_external) {
        this.sub_external = sub_external;
    }

    public String getSub_internal() {
        return sub_internal;
    }

    public void setSub_internal(String sub_internal) {
        this.sub_internal = sub_internal;
    }

    public String getExternal() {
        return external;
    }

    public void setExternal(String external) {
        this.external = external;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
}
