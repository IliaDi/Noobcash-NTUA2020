import os
import threading
from time import sleep
from concurrent.futures import ThreadPoolExecutor


# pool of threads (use for mining, broadcast, etc)
class Threadpool:

	def __init__(self, NUM_OF_THREADS = 2):
		print("threadpool_init")
		self.executor = ThreadPoolExecutor(NUM_OF_THREADS)

	#submit task
	def submit_task(self, f, tmp):
		print("\n____THREAD STARTING____")
		print("submit_task")
		future = self.executor.submit(f, tmp)
		return future

	#number of running threads