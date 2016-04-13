/*
 * Copyright 2013-2016, Corvusoft Ltd, All Rights Reserved.
 */

#ifndef _RESTBED_DETAIL_SOCKET_IMPL_H
#define _RESTBED_DETAIL_SOCKET_IMPL_H 1

//System Includes
#include <chrono>
#include <string>
#include <memory>
#include <cstdint>
#include <functional>

//Project Includes
#include "corvusoft/restbed/byte.hpp"
#include <boost/date_time/posix_time/posix_time.hpp>
//External Includes
#include <boost/asio.hpp>
#ifdef BUILD_SSL
    #include <boost/asio/ssl.hpp>
#endif

//System Namespaces

//Project Namespaces

//External Namespaces

namespace restbed
{
    //Forward Declarations
    class Logger;
    class Session;
    
    namespace detail
    {
        //Forward Declarations
        
        class SocketImpl
        {
            public:
                //Friends
                
                //Definitions
                
                //Constructors
                SocketImpl( const std::shared_ptr< boost::asio::ip::tcp::socket >& socket, const std::shared_ptr< Logger >& logger = nullptr );
#ifdef BUILD_SSL
                SocketImpl( const std::shared_ptr< boost::asio::ssl::stream< boost::asio::ip::tcp::socket > >& socket, const std::shared_ptr< Logger >& logger = nullptr );
#endif
                virtual ~SocketImpl( void );
                
                //Functionality
                void close( void );
                
                bool is_open( void ) const;
                
                bool is_closed( void ) const;
                
                void connect(  const std::string& hostname, const uint16_t port, boost::system::error_code& error );
                
				void sleep_for(const boost::posix_time::milliseconds& delay, const std::function< void(const boost::system::error_code&) >& callback);
                
                size_t write( const Bytes& data, boost::system::error_code& error );
                
                void write( const Bytes& data, const std::function< void ( const boost::system::error_code&, std::size_t ) >& callback );
                
                size_t read( const std::shared_ptr< boost::asio::streambuf >& data, const std::size_t length, boost::system::error_code& error );
                
                void read( const std::shared_ptr< boost::asio::streambuf >& data, const std::size_t length, const std::function< void ( const boost::system::error_code&, std::size_t ) >& callback );
                
                size_t read( const std::shared_ptr< boost::asio::streambuf >& data, const std::string& delimiter, boost::system::error_code& error );
                
                void read( const std::shared_ptr< boost::asio::streambuf >& data, const std::string& delimiter, const std::function< void ( const boost::system::error_code&, std::size_t ) >& callback );
                
                //Getters
                std::string get_local_endpoint( void ) const;
                
                std::string get_remote_endpoint( void ) const;
                
                //Setters
				void set_timeout(const boost::posix_time::milliseconds& value);
                
                //Operators
                
                //Properties
                
            protected:
                //Friends
                
                //Definitions
                
                //Constructors
                
                //Functionality
                
                //Getters
                
                //Setters
                
                //Operators
                
                //Properties
                
            private:
                //Friends
                
                //Definitions
                
                //Constructors
                SocketImpl( const SocketImpl& original ) = delete;
                
                //Functionality
                
                //Getters
                
                //Setters
                
                //Operators
                SocketImpl& operator =( const SocketImpl& value ) = delete;
                
                //Properties
                bool m_is_open;
                
                std::shared_ptr< Logger > m_logger;
                
				std::shared_ptr< boost::asio::deadline_timer > m_timer;
                
                std::shared_ptr< boost::asio::ip::tcp::socket > m_socket;
#ifdef BUILD_SSL
                std::shared_ptr< boost::asio::ssl::stream< boost::asio::ip::tcp::socket > > m_ssl_socket;
#endif
        };
    }
}

#endif  /* _RESTBED_DETAIL_SOCKET_IMPL_H */
