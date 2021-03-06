include: "//@{CONFIG_PROJECT_NAME}/*/employee.view.lkml"

view: employee {
  extends: [employee_config]
}

view: employee_core {
  sql_table_name: @{SCHEMA_NAME}.EMPLOYEE ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "UUID for this object."
  }

  dimension: first_name {
    label: "Employee First Name"
    type: string
    sql: ${TABLE}.first_name ;;
    description: "The employee's first name."
  }

  dimension: last_name {
    label: "Employee Last Name"
    type: string
    sql: ${TABLE}.last_name ;;
    description: "The employee's last name."
  }

  dimension: status {
    label: "Employee Status"
    type: yesno
    sql: ${TABLE}.status ;;
    description: "Specifies the status of the employees being fetched."
  }

  dimension_group: created {
    label: "Employee Created At"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
    description: "A read-only timestamp in RFC 3339 format."
  }

  dimension_group: updated {
    label: "Employee Updated At"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.updated_at ;;
    description: "A read-only timestamp in RFC 3339 format."
  }

  measure: count {
    label: "Employee Count"
    type: count
    drill_fields: [id, last_name, first_name, employee_wage.count, employee_location.count]
  }
}