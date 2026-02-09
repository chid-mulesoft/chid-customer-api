/**
 * DataWeave transformation for PATCH customer response
 * Transforms the updated customer data into a success response format
 */
%dw 2.0
output application/json
---
{
    "successCode": "CUSTOMER_UPDATED",
    "successMessage": "Customer with ID " ++ vars.customerId ++ " has been successfully updated",
    "customerId": vars.customerId,
    "updatedFields": vars.updatedFields default [],
    "timestamp": now()
}
