%dw 2.0
output application/json
/**
 * DataWeave transformation for Method Not Allowed error response
 * Generates a standardized 405 error response with JSON structure
 */
---
{
    "error": "Method Not Allowed",
    "message": "Method not allowed",
    "timestamp": now(),
    "status": 405
}
