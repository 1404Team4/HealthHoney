package util;

public class SegmentDto {
	private long startTimeNanos;
	private long endTimeNanos;
	private int segmentVal; // 활동종류
	private long segmentSum;
	private double distance;
	private int step;
	
	
	public long getSegmentSum() {
		return segmentSum;
	}
	public void setSegmentSum(long segmentSum) {
		this.segmentSum = segmentSum;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public long getStartTimeNanos() {
		return startTimeNanos;
	}
	public void setStartTimeNanos(long startTimeNanos) {
		this.startTimeNanos = startTimeNanos;
	}
	public long getEndTimeNanos() {
		return endTimeNanos;
	}
	public void setEndTimeNanos(long endTimeNanos) {
		this.endTimeNanos = endTimeNanos;
	}
	public int getSegmentVal() {
		return segmentVal;
	}
	public void setSegmentVal(int segmentVal) {
		this.segmentVal = segmentVal;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	} 
	
}
