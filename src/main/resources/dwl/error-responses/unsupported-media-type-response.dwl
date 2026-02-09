%dw 2.0
output application/json
/**
 * DataWeave transformation for Unsupported Media Type error response
 * Generates a standardized 415 error response with JSON structure
 */
---
{
    "error": "Unsupported Media Type",
    "message": "Unsupported media type",
    "timestamp": now(),
    "status": 415
}
