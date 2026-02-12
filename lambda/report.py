import json

def lambda_handler(event, context):
    print("Generating daily report...")
    return {
        'statusCode': 200,
        'body': json.dumps('Daily report generated successfully!')
    }
