%dw 2.0
output application/json
/**
 * DataWeave transformation for Not Found error response
 * Generates a standardized 404 error response with JSON structure
 */
---
{
    "error": "Not Found",
    "message": "Resource not found",
    "timestamp": now(),
    "status": 404
}
