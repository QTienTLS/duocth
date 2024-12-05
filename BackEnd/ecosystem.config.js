module.exports = {
  apps: [
  {
    name: 'MindStore-API',
    script: 'server.js',          // Đường dẫn đến file Bun app của bạn
    interpreter: 'bun',        // Sử dụng Bun làm runtime
    args: 'run dev1',               // Thêm args nếu cần thiết
    instances: 1,              // Tùy chọn: số lượng instance
    exec_mode: 'fork',         // Chạy theo kiểu fork hoặc cluster
    port: 1905,                // Đảm bảo ứng dụng nghe trên cổng 1905
  },
]
}