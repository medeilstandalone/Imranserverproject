package com.vanuston.medeil.util;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class AsyncTaskHelper implements Runnable {
    private static final ExecutorService QUEUE = Executors.newFixedThreadPool(10);
    private final Task peer;

    public AsyncTaskHelper(Task peer) {
        this.peer = peer;
    }

    public void start() {
        QUEUE.execute(this);
    }

    public void run() {
        peer.taskRun();
    }
    public static interface Task {
        public void taskRun();
    }
}


