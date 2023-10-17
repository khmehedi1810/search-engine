import { useForm } from "@inertiajs/react";
import axios from "axios";
import { useEffect, useState } from "react";

export default function Welcome({ auth, laravelVersion, phpVersion }) {
    const { data, setData } = useForm({
        search: ''
    });
    const [searctResult, setSearchResult] = useState([])
    const [originalData, setOriginalData] = useState([]);
    const [keywordCount, setKeywordCount] = useState([])
    const [copyData, setCopyData] = useState([]);
    const [startDate, setStartDate] = useState(null);
    const [endDate, setEndDate] = useState(null);

    const [isAscending, setIsAscending] = useState(true);
    const [keys, setKeys] = useState([]);
    const [selectedKeywords, setSelectedKeywords] = useState([]);


    const handleSearch = () => {
        axios.post('/api/search-data', { ...data })
            .then((res) => {
                const results = res?.data?.data?.results;
                setOriginalData(results);
                setSearchResult(results);
                setCopyData(results);
                console.log(results);
                let myObject = res?.data?.count;
                let countAbleKey = Object.entries(myObject).map(i => ({ key: i[0], value: i[1] }));
                setKeywordCount(countAbleKey);
            })
            .catch((err) => {
                setSearchResult([]);
            });
    }

    const handleYesterday = (e) => {
        if (e) {
            const today = new Date();
            const yesterday = new Date(today);
            yesterday.setDate(yesterday.getDate() - 1);
            filterData(yesterday, today);
        } else {
            setCopyData(originalData);
        }
    };

    const handleLast7Days = (e) => {
        if (e) {
            const today = new Date();
            const yesterday = new Date(today);
            yesterday.setDate(yesterday.getDate() - 7);
            filterData(yesterday, today);
        } else {
            setCopyData(originalData);
        }
    };

    const handleLast30Days = (e) => {
        if (e) {
            const today = new Date();
            const yesterday = new Date(today);
            yesterday.setDate(yesterday.getDate() - 30);
            filterData(yesterday, today);
        } else {
            setCopyData(originalData);
        }
    };

    const filterData = (startDate, endDate) => {
        const filteredData = originalData.filter(item => {
            const itemDate = new Date(item.created_at);
            return itemDate >= startDate && itemDate <= endDate;
        });
        setCopyData(filteredData);
    };

    const sortData = () => {
        const sortedData = [...copyData].sort((a, b) => {
            // Assuming you want to sort by the 'name' field
            return isAscending
                ? a.name.localeCompare(b.name)
                : b.name.localeCompare(a.name);
        });

        setCopyData(sortedData);
    };

    const toggleSortOrder = () => {
        setIsAscending(!isAscending);
        sortData();
    };

    // const Keysort = (data) => {
    //     setKeys(pre => {
    //         return [...pre, data]
    //     })
    //     const filteredData = copyData.filter(item => {
    //         const name = item.name.toLowerCase(); // Convert to lowercase for case-insensitive search
    //         return keys.some(key => name.includes(key.toLowerCase()));
    //     });

    //     setCopyData(filteredData);
    // };

    const formatDate = (dateString) => {
        const options = {
            weekday: 'short',
            month: 'short',
            day: 'numeric',
            year: 'numeric',
            hour: 'numeric',
            minute: 'numeric',
            second: 'numeric',
            timeZoneName: 'short'
        };
        const date = new Date(dateString);
        return date.toLocaleString(undefined, options);
    }

    useEffect(() => {
        if (startDate !== null && endDate !== null) {
            filterData(new Date(startDate), new Date(endDate));
        }
    }, [startDate, endDate])

    return (
        <>
            <div class="flex flex-col items-center justify-center bg-white mt-5">
                <div>
                    <img class="h-[89px] w-[273px]" src="https://ppc.co/wp-content/uploads/2021/01/Google.png" alt="google Logo" />
                </div>
                <div class="md:w-[584px] mx-auto mt-7 flex w-[92%] items-center rounded-full border hover:shadow-md">
                    <div class="pl-5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </div>
                    <input
                        type="text"
                        class="w-full bg-transparent rounded-full py-[14px] pl-4 outline-none border-none focus:border-none"
                        onChange={(e) => setData('search', e.target.value)}
                    />
                    <div class="pr-5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 11a7 7 0 01-7 7m0 0a7 7 0 01-7-7m7 7v4m0 0H8m4 0h4m-4-8a3 3 0 01-3-3V5a3 3 0 116 0v6a3 3 0 01-3 3z" />
                        </svg>
                    </div>
                </div>
                <div class="mt-3 flex space-x-12">
                    <button class="bg-[#f8f9fa] px-2 py-1" onClick={() => {
                        handleSearch();
                    }}>Google Search</button>
                </div>
                {searctResult.length !== 0 ? (
                    <div class='w-3/6 my-12'>
                        <div class="flex flex-col">
                            <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                                <div class="inline-block w-full py-2 sm:px-6 lg:px-8">

                                    <div class="">

                                        <div class="flex items-center">
                                            <h1 class="text-2xl font-semibold mb-4 mr-3">Filtered Data: </h1>

                                            <div class="flex items-center mb-4">
                                                <div class='mr-2'>
                                                    <button
                                                        class="bg-gray-100 text-gray-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-gray-300"
                                                        onClick={toggleSortOrder}
                                                    >
                                                        Toggle Sort Order
                                                    </button>
                                                </div>
                                                <div class='mr-2'>
                                                    <label for="chkYesterday" class="flex items-center">
                                                        <input
                                                            id="chkYesterday"
                                                            type="checkbox"
                                                            class="form-checkbox text-blue-500 h-5 w-5"
                                                            onChange={(e) => handleYesterday(e.target.checked)}
                                                        />
                                                        <span class="ml-2">Yesterday</span>
                                                    </label>
                                                </div>
                                                <div class='mr-2'>
                                                    <label for="chkLast7Days" class="flex items-center">
                                                        <input
                                                            id="chkLast7Days"
                                                            type="checkbox"
                                                            class="form-checkbox text-blue-500 h-5 w-5"
                                                            onChange={(e) => handleLast7Days(e.target.checked)} />
                                                        <span class="ml-2">Last 7 Days</span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label for="chkLast30Days" class="flex items-center">
                                                        <input
                                                            id="chkLast30Days"
                                                            type="checkbox"
                                                            class="form-checkbox text-blue-500 h-5 w-5"
                                                            onChange={(e) => handleLast30Days(e.target.checked)} />
                                                        <span class="ml-2">Last 30 Days</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex space-x-4 mt-4  items-center">
                                            <label class="text-sm">Start Date:</label>
                                            <input
                                                type="date"
                                                value={startDate}
                                                onChange={(e) => setStartDate(e.target.value)}
                                            />
                                            <label class="text-sm">End Date:</label>
                                            <input
                                                type="date"
                                                value={endDate}
                                                onChange={(e) => setEndDate(e.target.value)}
                                            />
                                        </div>
                                        <br />
                                        <div>
                                            <span class='text-lg font-semibold'>Keywords: </span>
                                            {
                                                keywordCount && keywordCount.map((item, i) => (
                                                    <button key={i}
                                                        class="bg-gray-100 text-gray-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-gray-300"

                                                    >
                                                        {item.key} <span class='bg-white text-black ml-2 px-1 rounded-full'>{item.value}</span>
                                                    </button>
                                                ))
                                            }
                                        </div>
                                    </div>

                                    <div class="overflow-hidden">
                                        <table class="w-full text-left text-sm font-light">
                                            <thead class="border-b font-medium dark:border-neutral-500">
                                                <tr>
                                                    <th scope="col" class="px-6 py-4">Name </th>
                                                    <th scope="col" class="px-6 py-4">Email</th>
                                                    <th scope="col" class="px-6 py-4">Created At</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {copyData && copyData.map(item => (
                                                    <tr key={item.id} class="border-b dark:border-neutral-500">
                                                        <td class="whitespace-nowrap px-6 py-4">{item?.name}</td>
                                                        <td class="whitespace-nowrap px-6 py-4">{item?.email}</td>
                                                        <td class="whitespace-nowrap px-6 py-4">{item?.created_at}</td>
                                                    </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                ) : (' ')}
            </div>


        </>
    );
}
