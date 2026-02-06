%dw 2.0
output application/json
/**
 * DataWeave transformation for Bad Request error response
 * Generates a standardized 400 error response with JSON structure
 */
---
{
    "error": "Bad Request",
    "message": "Invalid request parameters",
    "timestamp": now(),
    "status": 400
}
