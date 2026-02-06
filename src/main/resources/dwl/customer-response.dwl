%dw 2.0
output application/json
/**
 * DataWeave transformation for customer response
 * Maps customer data to standardized response format
 * This will be used inline with proper variable context
 */
---
{
    "id": payload.id,
    "firstName": payload.firstName default "Chid",
    "lastName": payload.lastName default "Customer", 
    "age": payload.age default 18,
    "timestamp": now()
}
