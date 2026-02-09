%dw 2.0
output application/json
/**
 * DataWeave transformation for Not Implemented error response
 * Generates a standardized 501 error response with JSON structure
 */
---
{
    "error": "Not Implemented",
    "message": "Not Implemented",
    "timestamp": now(),
    "status": 501
}
