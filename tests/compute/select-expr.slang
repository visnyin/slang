//TEST(smoke,compute):COMPARE_COMPUTE:
//TEST_INPUT:ubuffer(data=[0 0 0 0], stride=4):dxbinding(0),glbinding(0),out


// Test IR code generation for the `?:` "select" operator

int test(int input)
{
	return input > 1 ? -input : input;
}

RWStructuredBuffer<int> outputBuffer;

[numthreads(4, 1, 1)]
void computeMain(uint3 dispatchThreadID : SV_DispatchThreadID)
{
    outputBuffer[dispatchThreadID.x] = test((int) dispatchThreadID.x);
}