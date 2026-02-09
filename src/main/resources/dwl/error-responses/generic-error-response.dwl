%dw 2.0
output application/json
/**
 * DataWeave transformation for Generic error response
 * Generates a standardized 500 error response with JSON structure
 */
---
{
    "error": "Internal Server Error",
    "message": "An unexpected error occurred",
    "timestamp": now(),
    "status": 500
}
