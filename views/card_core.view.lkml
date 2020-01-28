include: "//@{CONFIG_PROJECT_NAME}/*/card.view.lkml"

view: card {
  extends: [card_config]
}

view: card_core {
  sql_table_name: @{SCHEMA_NAME}.CARD ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
    description: "Unique ID for this card. Generated by Square."
  }

  dimension: billing_address {
    label: "Card Billing Address"
    type: string
    sql: ${TABLE}.billing_address ;;
    description: "The billing address for this card."
  }

  dimension: card_brand {
    type: string
    sql: ${TABLE}.card_brand ;;
    description: "The card's brand (such as VISA). See CardBrand for all possible values."
  }

  dimension: cardholder_name {
    type: string
    sql: ${TABLE}.cardholder_name ;;
    description: "The name of the cardholder."
  }

  dimension: exp_month {
    label: "Card Exp Month"
    type: string
    sql: ${TABLE}.exp_month ;;
    description: "The expiration month of the associated card as an integer between 1 and 12."
  }

  dimension: exp_year {
    label: "Card Exp Year"
    type: number
    sql: ${TABLE}.exp_year ;;
    description: "The four-digit year of the card's expiration date."
  }

  dimension: fingerprint {
    label: "Card Fingerprint"
    type: string
    sql: ${TABLE}.fingerprint ;;
    description: "Not currently set. Intended as a Square-assigned identifier, based  on the card number, to identify the card across multiple locations within a single application."
  }

  dimension: last_4 {
    label: "Card Last 4"
    type: number
    sql: ${TABLE}.last_4 ;;
    description: "The last 4 digits of the card number."
  }
}
