//TEST(compute):COMPARE_COMPUTE:
//TEST_INPUT:ubuffer(data=[0 1 2 3], stride=4):dxbinding(0),glbinding(0),out

// Test that `break` from a loop works.

int test(int inVal)
{
	int ii = 0;
	for(;;)
	{
		if(ii >= inVal)
			break;
	    ii++;
	}
	return -ii;
}

RWStructuredBuffer<int> outputBuffer : register(u0);

[numthreads(4, 1, 1)]
void computeMain(uint3 dispatchThreadID : SV_DispatchThreadID)
{
	uint tid = dispatchThreadID.x;
	int inVal = outputBuffer[tid];
	int outVal = test(inVal);
	outputBuffer[tid] = outVal;
}